const pay = () => {
  //console.log("OK")
  Payjp.setPublicKey("pk_test_10537e5067c0d75c7457f893");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("order[number]"),
      exp_month: formData.get("order[number_month]"),
      exp_year: `20${formData.get("order[number_date]")}`,
      cvc: formData.get("order[card_cvc]"),
    };
    

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
  
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' > `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay); 