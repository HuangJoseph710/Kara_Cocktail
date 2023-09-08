// 購物車增減
window.onload=async function(){
    addListener();
    addCartListener();
    addCarListener();
}

// 上方購物車
function addListener() {
    let num = document.getElementById("num");// 獲取id為"num" 的元素

    // 為增加按鈕添加點擊事件監聽器
    document.getElementById("add").addEventListener("click", function() {
        num.value = parseInt(num.value)+1;// 將輸入框的數值加1
    });

    // 為減少按鈕添加點擊事件監聽器
    document.getElementById("reduce").addEventListener("click", function() {
        if(num.value <= 0) {
            num.value = 0;// 如果數值小於等於0，將數值設為0
        }else {
            num.value = parseInt(num.value)-1;// 將輸入框的數值減1
        }
    });
}

// 下方購物車
function addCartListener() {
    let num = document.getElementById("number");// 獲取id為"num" 的元素

    // 為增加按鈕添加點擊事件監聽器
    document.getElementById("up").addEventListener("click", function() {
        num.value = parseInt(num.value)+1;// 將輸入框的數值加1
    });

    // 為減少按鈕添加點擊事件監聽器
    document.getElementById("down").addEventListener("click", function() {
        if(num.value <= 0) {
            num.value = 0;// 如果數值小於等於0，將數值設為0
        }else {
            num.value = parseInt(num.value)-1;// 將輸入框的數值減1
        }
    });
}

// 一個頁面要設置多個表單需命名不同id和不同js函數寫在window.onload裡面

function addCarListener() {
    let num = document.getElementById("numberr");// 獲取id為"num" 的元素

    // 為增加按鈕添加點擊事件監聽器
    document.getElementById("upp").addEventListener("click", function() {
        num.value = parseInt(num.value)+1;// 將輸入框的數值加1
    });

    // 為減少按鈕添加點擊事件監聽器
    document.getElementById("downn").addEventListener("click", function() {
        if(num.value <= 0) {
            num.value = 0;// 如果數值小於等於0，將數值設為0
        }else {
            num.value = parseInt(num.value)-1;// 將輸入框的數值減1
        }
    });
}