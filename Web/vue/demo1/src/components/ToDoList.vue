<template>
  <div class="container">
    <div class="header">To Do List</div>
    <div class="middle">
      <input class="input-search" placeholder="To Add Title" />
      <router-link to="/to-do-item">
        <button class="button-add">Add</button>
      </router-link>
    </div>
    <div class="to-do-list">
      <to-do-item v-for="(item, index) in items" :key="index" :title="item.title" :content="item.content" :finished="item.finished" />
    </div>
  </div>
</template>

<script>
import Vue from 'vue'
Vue.component('to-do-item', {
  props: {
    title: String,
    content: String,
    finished: Boolean
  },
  data: function () {
    return {
      
    }
  },
  template: `
    <div>
      <div class="item-title" style="background: orange;">{{title}}</div>
      <div class="item-content">{{content}}</div>
      <div class="item-finished">{{finished}}</div>
    </div>
  `,
  style: `
    .item-title {
      background: orange;
    }
  `
})

export default {
  name: 'ToDoList',
  data () {
    return {
      items: [
        {
          title: 'go home',
          content: 'as quickly as possible',
          finished: false
        }
      ]
    } 
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.container{
  background-color: white;
}

.header {
  background: #2A282E;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 64px;
  color: white;
  font-weight: bold;
}

.middle {
  padding: 0 12px 0 12px;
  height: 60px;
  background-color: black;
  opacity: 0.1;
  display: flex;
  align-items: center;
}

.input-search {
 flex-grow: 1;
 height: 30px;
 color: black;
 font-size: 12px;
}

.button-add {
  margin-left: 12px;
  background-color: #996633;
  color: white;
  font-size: 15px;
}

.to-do-list {
  position: absolute;
  left: 0;
  right: 0;
  top: 124px;
  bottom: 0;
}

</style>
