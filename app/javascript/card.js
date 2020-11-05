const pay = () => {
  Payjp.setPublicKey("pk_test_b6e359a54f3f93d9ca1e5748");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    
    const card = {
      number: formData.get("form[card_number]"),
      cvc: formData.get("form[cvc]"),
      exp_month: formData.get("form[exp_month]"),
      exp_year: `20${formData.get("form[exp_year]")}`,
    };
    console.log(card)
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(response);
        console.log(token);
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      // debugger
      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);