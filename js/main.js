const app = Vue.createApp({
    created() {
        this.fetchConsoles(); // 在 created 時就開始抓取主機資料
    },
    data() {
        return {
            consoleList: [],       // 儲存所有主機列表
            name: "",              // 單個主機名稱
            release_year: "",      // 發佈年份
            description: "",       // 特色描述
            image: "",             // 圖片
            error: "",             // 錯誤訊息
            features: [],          // 儲存特徵列表
            loadingConsoles: true, // 加載主機列表的狀態
            loading: false         // 加載單個主機資料的狀態
        };
    },
    methods: {
        // 抓取所有主機的資料
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
        // 抓取單個主機的詳細資料
        getConsole(id) {
            this.loading = true;
            this.error = ""; // 清除先前的錯誤訊息
            fetch(`http://localhost:8888/nintendogame-api/public/consoles/${id}`)
                .then(response => response.json())
                .then(data => {
                    this.loading = false;
                    if (data && data.id) {
                        this.name = data.name || 'Not Available';
                        this.release_year = data.release_year || 'Not Available';
                        this.image = data.image_url || '';
                        this.features = data.features || []; // 存儲該主機的所有特徵
                    } else {
                        this.error = "No console found with the given ID.";
                    }
                    document.getElementById('detail').scrollIntoView({ behavior: 'smooth' }); // 頁面滾動到詳細資料區
                })
                .catch(error => {
                    console.error(error);
                    this.error = "Failed to fetch console detail.";
                    this.loading = false;
                });
        }
    }
}).mount("#app");
