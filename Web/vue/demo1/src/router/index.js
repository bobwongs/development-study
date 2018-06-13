import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import ToDoItem from '@/components/ToDoItem'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/to-do-item',
      name: 'ToDoItem',
      component: ToDoItem
    }
  ]
})
