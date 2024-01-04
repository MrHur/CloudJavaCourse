var heading = document.querySelector("#heading");
heading.onclick = function () {
  heading.style.color = "red";
  if ((heading.style.color = "red"))
    heading.onclick = function () {
      heading.style.color = "blue";
    };
};
