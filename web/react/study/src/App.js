import React, { Component } from 'react'
import logo from './logo.svg'
import './App.css'
import { createStore } from 'redux'
import { connect, Provider } from 'react-redux'


class App extends Component {
  constructor(props) {
    super(props)
    // this.state = store.getState()
    test()
  }

  // componentWillMount() {
  //   store.subscribe((state)=>this.setState(store.getState()))
  // }

  render() {
    // return (
    //   <div className="App">
    //     <ItemView title = 'Wash Water' />
    //   </div>
    // );
    // return <Comp state={this.state}
    //              onIncrease={()=>store.dispatch(actions.increase())}
    //              onDecrease={()=>store.dispatch(actions.decrease())}
    // />
    return (
      <Provider store={store}>
        {/* <Comp/> */}
        <MyComp name='bob' />
      </Provider>
    )
  }
}

export default App;


class ItemView extends Component {
  render() {
    return (
      <div>
        <div>{this.props.title}</div>
        <div>{JSON.stringify(this.props)}</div>
      </div>
    )
  }
}

const FullItemView = connect(mapStateToProps)(ItemView)


const reducer = (state = {count: 20}, action) => {
  switch (action.type){
    case 'INCREASE': return {count: state.count + 1};
    case 'DECREASE': return {count: state.count - 1};
    default: return state;
  }
}

const store = createStore(reducer);
store.subscribe(() =>
  console.log(store.getState())
);

const actions = {
  increase: () => ({type: 'INCREASE'}),
  decrease: () => ({type: 'DECREASE'})
}

class Comp extends Component {
  constructor(props) {
    super(props)
    console.log(props.name);    
  }

  render() {
    const {count, increase, decrease} = this.props;
    return (
      <div>
        <div>Count: {count}</div>
        <button onClick={increase}>Increase</button>
        <button onClick={decrease}>Ondecrease</button>
      </div>
    )
  }
}

const mapStateToProps = (state) => {
  return {
    count: state.count
  }
}

const mapActionToProps = (dispatch) => {
  return {
    increase: (...args) => dispatch(actions.increase(...args)),
    decrease: (...args) => dispatch(actions.decrease(...args))
  }
}

const MyComp = connect(mapStateToProps, mapActionToProps)(Comp)

const test = () => {
  let list = [1, 3]
  let list0 = list.map((item) => {
    if (item === 1) return
    return item
  })
  let list1 = list.filter((item) => {
    return item === 1
  })
  console.log(list)
  console.log(list0)
  console.log(list1)
}