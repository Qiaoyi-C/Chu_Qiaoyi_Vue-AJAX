const app = Vue.createApp({
    created() {
        this.fetchConsoles();
    },
    data() {
        return {
            consoleList: [],
            name: "",
            release_year: "",
            description: "",
            image: "",
            error: "",
            features: [],
            loadingConsoles: true,
            loading: false,
            showFeatureModal: false 
        };
    },
    methods: {
        fetchConsoles() {
            fetch('http://localhost:8888/nintendogame-api/public/consoles')
                .then(response => response.json())
                .then(data => {
                    this.consoleList = data;
                    this.loadingConsoles = false;
                })
                .catch(error => {
                    console.error(error);
                    this.error = "Failed to fetch consoles.";
                    this.loadingConsoles = false;
                });
        },
        getConsole(id) {
            this.loading = true;
            this.error = "";
            fetch(`http://localhost:8888/nintendogame-api/public/consoles/${id}`)
                .then(response => response.json())
                .then(data => {
                    this.loading = false;
                    if (data && data.id) {
                        this.name = data.name || 'Not Available';
                        this.release_year = data.release_year || 'Not Available';
                        this.image = data.image_url || '';
                        this.features = data.features || [];
                        this.showFeatureModal = true; 
                    } else {
                        this.error = "No console found with the given ID.";
                    }
                })
                .catch(error => {
                    console.error(error);
                    this.error = "Failed to fetch console detail.";
                    this.loading = false;
                });
        },
        closeFeatureModal() { 
            this.showFeatureModal = false;
        }
    }
}).mount("#app");
