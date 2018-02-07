
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('chat', require('./components/Chat.vue'));
Vue.component('chat-composer', require('./components/ChatComposer.vue'));
Vue.component('onlineuser', require('./components/OnlineUser.vue'));
Vue.component('task-list', require('./components/TaskList.vue'));
const app = new Vue({
    el: '#app',
    data:{
    	chats: '',
        onlineUsers: ''

    },
    created() {
    	const userId = $('meta[name="userId"]').attr('content') ;
    	const friendId = $('meta[name="friendId"]').attr('content') ;
    	if(friendId != undefined)
    	{
    	//	alert("friend id:"+friendId);
    		axios.post('/chat/getChat/'+ friendId).then((response) =>{
    			//alert('valores, Uusario:'+userId+'   - Friend:'+friendId+'   - Rta:'+response.data);
    			this.chats = response.data;
    		});
    		Echo.private('Chat.'+friendId+'.' +userId)
    		.listen('BroadcastChat', (e)=>{
    			document.getElementById('ChatAudio').play();
    			this.chats.push(e.chat);
    		});
    	}
       if (userId != 'null') {
            Echo.join('Online')
                .here((users) => {
                    this.onlineUsers = users;
                })
                .joining((user) => {
                    this.onlineUsers.push(user);
                })
                .leaving((user) => {
                    this.onlineUsers = this.onlineUsers.filter((u) => {u != user});
                });
        }
    }
});
