const app = Vue.createApp({
    created(){
        fetch('http://localhost:8888/bookstore-api/public/books')
        .then(response => response.json())
        .then(data => {
            // console.log(data)
            this.booksData = data;
            this.loadingBooks = false;
        })
        .catch(error => console.error(error));
    },
    data(){
        return{
            booksData:[],
            name:"",
            published_data:"",
            bio:"",
            image:"",
            error:"",
            loadingBooks:true,
            loading:false
        }
    },
    methods:{
        getBook(id){
            this.loading = true;
            console.log(id);
            fetch(`http://localhost:8888/bookstore-api/public/books/${id}`) 
            .then(response => response.json())
            .then(data =>{
                this.loading = false;
                if(data.length > 0) {
                    const bookData = data[0];
                    this.name = bookData.name ? bookData.name :'Not Available';
                    this.published_data = bookData.published_data ? bookData.published_data : 'Not Available';
                    this.bio = bookData.bio ? bookData.bio : 'Not Available';
                    this.image = bookData.book_image ? bookData.book_image : 'Not Available';
                }else{
                    this.error = "No book found with the given query";
                }
                
            })
            .then(document.documentElement.scrollIntoView({behavior:'smooth', block:'end'}))
            .catch(error => console.error(error))
        }
    }
}).mount("#app")