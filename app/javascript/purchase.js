const x =  async (card) => { 
  Payjp.setPublicKey("pk_test_b98dd23d7ef78e44f7281b00"); 
  await Payjp.createToken(card, (status, response) => {
    if (status == 200) {
      const token = response.id;
      const renderDom = document.getElementById("charge-form");
      const tokenObj = `<input value=${token} name='token'>`;
      renderDom.insertAdjacentHTML("beforeend", tokenObj);
      debugger;
    } else {
      alert(status);
    }
    document.getElementById("card-number").removeAttribute("name");
    document.getElementById("card-cvc").removeAttribute("name");
    document.getElementById("card-exp-month").removeAttribute("name");
    document.getElementById("card-exp-year").removeAttribute("name");
    document.getElementById("charge-form").submit();
    })
}

const pay = () => {
  Payjp.setPublicKey("pk_test_b98dd23d7ef78e44f7281b00"); // PAY.JPテスト公開鍵
  const form = document.getElementById("charge-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    const card = {
      number: formData.get("order[number]"),
      cvc: formData.get("order[cvc]"),
      exp_month: formData.get("order[exp_month]"),
      exp_year: `20${formData.get("order[exp_year]")}`,
    };
    x(card);

  });
};

window.addEventListener("load", pay);
