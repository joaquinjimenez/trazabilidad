<style scoped>
    .panel-block {
        flex-direction: column;
        border: none;
    }
    .chat {
        width: 100%;
        padding: 20px;
        box-shadow: inset 0 0 20px 0 grey;
        margin-bottom: 20px;
        border: 1px solid grey;
        max-height: 600px;
        overflow-x: auto;
        overflow-y : scroll;
    }
    .chat .chat-right, .chat .chat-left {
        max-width: 70%;
        box-shadow: 0 0 8px 0px grey;
        padding: 8px;
        margin: 4px;
    }
    .chat-right {
        float: right;
    }
    .chat-left {
        float: left;
    }
    .no-message {
        height: 200px;
        display: flex;
        align-items: center;
    }
</style>

<template>
    <div class="panel-block">
        <div class="chat" v-if="chats.lenght != 0">
            <div v-for="chat in chats">
                <div class="chat-right" v-if="chat.user_id == userid">
                    {{chat.chat}}
                    <br>
                </div>
                <div class="chat-left" v-else>
                    {{chat.chat}}
                    <br>
                </div>
            </div>
            
        </div>
        <div v-else class="no-message" >
            There are not messages
        </div>
        <chat-composer v-bind:friendid="friendid" v-bind:userid="userid" v-bind:chats="chats" ></chat-composer>
    </div>
</template>
<script>
    export default {
        props:['chats', 'userid', 'friendid'],
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
