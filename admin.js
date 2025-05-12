// js/admin.js

document.addEventListener("DOMContentLoaded", () => {
  loadUsers();
  loadResources();
  loadEvents();
});

document.getElementById("addResourceForm").addEventListener("submit", e => {
  e.preventDefault();
  const form = e.target;
  const payload = {
    title:      form.title.value,
    type:       form.type.value,
    subject:    form.subject.value,
    description: form.description.value,
    uploaded_by: form.uploaded_by.value,
    date_uploaded: form.date_uploaded.value
  };
  fetch("php/insert_resource.php", {
    method: "POST",
    headers: {"Content-Type":"application/json"},
    body: JSON.stringify(payload)
  })
  .then(() => {
    form.reset();
    loadResources();
  })
  .catch(console.error);
});


// Fetch and display users
function loadUsers() {
  fetch("php/get_users.php")
    .then(res => res.json())
    .then(data => {
      const resourceSection = document.getElementById("addResourceForm");
      resourceSection.innerHTML = "";
      data.forEach(resource => {
        const row = `<tr>
          <td>${resource.id}</td>
          <td>${resource.title}</td>
          <td>${resource.link}</td>
        </tr>`;
        resourceSection.innerHTML += row;
      });
    })
    .catch(console.error);
}

// Fetch and display resources
function loadResources() {
  fetch("php/get_resources.php")
    .then(res => res.json())
    .then(data => {
      const tbody = document.getElementById("resourceTableBody");
      tbody.innerHTML = "";
      data.forEach(resource => {
        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${resource.id}</td>
          <td>${resource.title}</td>
          <td>${resource.type}</td>
          <td>${resource.subject}</td>
          <td>${resource.description}</td>
          <td>${resource.uploaded_by}</td>
          <td>${resource.date_uploaded}</td>
          <td class="actions">
            <!-- you can later inject Edit/Delete buttons here -->
          </td>
        `;
        tbody.appendChild(row);
      });
    })
    .catch(console.error);
}

// Fetch and display events
function loadEvents() {
  fetch("php/get_events.php")
    .then(res => res.json())
    .then(data => {
      const tbody = document.getElementById("eventTableBody");
      tbody.innerHTML = "";
      data.forEach(ev => {
        const row = document.createElement("tr");
        row.innerHTML = `
          <td>${ev.id}</td>
          <td>${ev.title}</td>
          <td>${ev.description}</td>
          <td>${ev.event_date}</td>
          <td>${ev.location}</td>
          <td class="actions">
            <!-- edit/delete -->
          </td>
        `;
        tbody.appendChild(row);
      });
    })
    .catch(console.error);
}
