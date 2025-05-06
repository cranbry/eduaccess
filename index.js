const header = document.querySelector("header");

window.addEventListener("scroll", function() {
    header.classList.toggle ("sticky", window.scrollY > 120);

});

let menu = document.querySelector('#menu-icon');
let navlist = document.querySelector('.navlist');

menu.onclick = () => {
    menu.classList.toggle('bx-x');
    navlist.classList.toggle('active')
};

window.onscroll = () => {
    menu.classList.remove('bx-x');
    navlist.classList.remove('active')
};

// Here it starts

function performSearch() {
    const query = document.getElementById("edu-search").value.trim();
    if (!query) return;
    window.location.href = `search.html?q=${encodeURIComponent(query)}`;
  }
  

// shift alt down arrow key

sendMail = () => {
    let params = {
        name: document.getElementById("name").value,
        email: document.getElementById("email").value,
        message: document.getElementById("message").value,
    };
const serviceID = "service_0d285d2";
const templateID = "template_51afi0q"

emailjs.send(serviceID,templateID,params).then(
    res =>{
        document.getElementById("name").value = "";
        document.getElementById("email").value = "";
        document.getElementById("message").value = "";
        console.log(res);
        alert("Message Sent Successfully!")
    }
)

.catch((err) => console.log(err));
}

