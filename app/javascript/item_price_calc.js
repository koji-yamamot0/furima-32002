function calc (){
    const price = document.getElementById("item-price");
    price.addEventListener("keyup", () => {
        let date = document.getElementById("item-price").value;
        let tax = Math.round(date * 0.1);
        document.getElementById("add-tax-price").innerHTML = tax;
        let profit = (date - tax );
        document.getElementById("profit").innerHTML = profit
    });
};

window.addEventListener('load', calc);