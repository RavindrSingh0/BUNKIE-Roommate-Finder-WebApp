document.addEventListener("DOMContentLoaded", function() {
    const signupBtn = document.getElementById("get-started-btn");
    const loginLink = document.getElementById("login-link");
    const popupContainer = document.getElementById("popup-container");
    const signupPopup = document.getElementById("signup-popup");
    const loginPopup = document.getElementById("login-popup");

    signupBtn.addEventListener("click", function(event) {
        event.preventDefault();
        popupContainer.style.display = "flex";
        signupPopup.style.display = "block";
    });

    loginLink.addEventListener("click", function(event) {
        event.preventDefault();
        popupContainer.style.display = "flex";
        loginPopup.style.display = "block";
    });

    // Add event listeners for closing pop-ups
    document.getElementById("close-signup-popup").addEventListener("click", function() {
        popupContainer.style.display = "none";
        signupPopup.style.display = "none";
    });

    document.getElementById("close-login-popup").addEventListener("click", function() {
        popupContainer.style.display = "none";
        loginPopup.style.display = "none";
    });

    popupContainer.addEventListener("click", function(event) {
        if (event.target === popupContainer) {
            popupContainer.style.display = "none";
            signupPopup.style.display = "none";
            loginPopup.style.display = "none";
        }
    });

    signupPopup.addEventListener("click", function(event) {
        event.stopPropagation();
    });

    loginPopup.addEventListener("click", function(event) {
        event.stopPropagation();
    });
});

// nav-links

document.querySelectorAll('.nav-links a').forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault(); // Prevent default anchor link behavior
      const targetSection = document.querySelector(this.getAttribute('href'));
      targetSection.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
      });
    });
  });
  


// Function to open Matches page in a new tab
function openMatchesPageInNewTab() {
    // URL to the Matches page (replace with the actual URL)
    const matchesPageUrl = 'matches.php'; // Example URL, replace with actual URL

    // Open Matches page in a new tab
    window.open(matchesPageUrl, '_blank');
}

// Event listener for login form submission
const loginForm = document.getElementById('login-form');
loginForm.addEventListener('submit', function(event) {
    // Prevent default form submission
    event.preventDefault();

    // Collect form data
    const formData = new FormData(loginForm);

    // Send form data to the server using AJAX
    fetch('login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            // If login is successful, redirect to the Matches page
            openMatchesPageInNewTab();
        } else {
            // Handle login errors if any
            console.error('Login failed');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

// Event listener for signup form submission
const signupForm = document.getElementById('signup-form');
signupForm.addEventListener('submit', function(event) {
    // Prevent default form submission
    event.preventDefault();

    // Collect form data
    const formData = new FormData(signupForm);

    // Send form data to the server using AJAX
    fetch('signup.php', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            // If signup is successful, redirect to the Matches page
            openMatchesPageInNewTab();
        } else {
            // Handle signup errors if any
            console.error('Signup failed');
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });
});

function populateBranches() {
    var course = document.getElementById("course").value;
    var branchSelect = document.getElementById("branch");
    branchSelect.innerHTML = ""; // Clear existing options
    
    var branches = [];
    switch(course) {
      case "btech":
        branches = ["CSE", "IOT", "AIML", "IT"];
        break;
      case "bba":
        branches = ["Marketing", "Finance", "Human Resource", "International Business"];
        break;
      case "ba":
        branches = ["Economics", "Psychology", "Political Science", "Philosophy"];
        break;
      case "llb":
        branches = ["Corporate Law", "Criminal Law", "Constitutional Law", "Family Law"];
        break;
      default:
        branches = [];
    }
  
    branches.forEach(function(branch) {
      var option = document.createElement("option");
      option.value = branch;
      option.textContent = branch;
      branchSelect.appendChild(option);
    });
}
