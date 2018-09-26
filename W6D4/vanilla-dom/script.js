document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  const addRestaurant = e => {
    e.preventDefault();
    const ul = document.getElementById("restaurants");
    const li = document.createElement("li");
    // debugger;
    li.textContent = document.querySelector(".favorite-input").value;
    ul.appendChild(li);
    document.querySelector(".favorite-input").value = "";
  }

  const submit = document.querySelector(".favorite-submit");
  submit.addEventListener("click", addRestaurant);


  // adding new photos

  // --- your code here!



});
