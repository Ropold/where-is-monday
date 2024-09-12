import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="nearby-cats"
export default class extends Controller {
  static targets = ['container']
  connect() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition((position) => this.fetchNearbySightings(position));
    }
  }

  // fetchNearbySightings(position) {
  //   const latitude = position.coords.latitude;
  //   const longitude = position.coords.longitude;
  //   // Fetch nearby cats from the server
  //   fetch('/cats/nearby', {
  //     method: 'POST',
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  //     },
  //     body: JSON.stringify({
  //       latitude: latitude,
  //       longitude: longitude
  //     })
  //   }).then(response => response.json())
  //     .then(data => {
  //       console.log(data);
  //       console.log("hi there");
  //       this.containerTarget.innerHTML = '';
  //       const title = `
  //         <div class="text-center my-5">
  //           <h4 style="font-weight: bold; font-size: 40px;">Recently Lost Cats:</h4>
  //         </div>
  //       `
  //       this.containerTarget.insertAdjacentHTML('beforeend', title);

  //       data.forEach(cat => {
  //         const catElement = document.createElement("div")
  //         catElement.classList.add("col-lg-3", "col-md-6", "col-sm-6", "mb-4")
  //         catElement.innerHTML = `
  //           <div class="card-cat">
  //             <img src="${cat.photo_url}" height="300" width="400" />
  //             <div class="overlay-text card-cat-label">Recently Lost</div>
  //             <div class="card-body">
  //               <h3 class="card-title">${cat.name}</h3>
  //               <p class="card-text">${cat.description}</p>
  //               <a href="/cats/${cat.id}" class="btn btn-warning">Find me</a>
  //             </div>
  //           </div>
  //         `
  //         this.containerTarget.appendChild(catElement)
  //       });
  //     })
  // }

  fetchNearbySightings(position) {
    const latitude = position.coords.latitude;
    const longitude = position.coords.longitude;

    // Fetch nearby cats from the server
    fetch('/cats/nearby', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
      },
      body: JSON.stringify({
        latitude: latitude,
        longitude: longitude
      })
    }).then(response => response.json())
      .then(data => {
        console.log(data);
        this.containerTarget.innerHTML = '';

        // Title element
        const title = `
          <div class="text-center my-5 text-shadow">
            <h3>Recently lost cats</h3>
          </div>
        `;
        this.containerTarget.insertAdjacentHTML('beforeend', title);

        data.forEach((cat, index) => {
          let catElement;

          // First cat: larger image and layout
          if (index === 0) {
            catElement = `
              <div class="col-lg-6 col-md-12 mb-4">
                <div class="card-cat">
                  <img src="${cat.photo_url}" height="600" width="800" style="object-fit: cover;" />
                  <div class="overlay-text card-cat-label">Recently Lost</div>
                  <div class="card-body">
                    <h3 class="card-title">${cat.name}</h3>
                    <p class="card-text">${cat.description.slice(0,55)} ...</p>
                    <a href="/cats/${cat.id}" class="btn custom-btn">
                      <i class="fa-solid fa-paw orange-paw"></i>
                      <span class="details-text orange-paw">Details</span>
                    </a>
                  </div>
                </div>
              </div>
            `;
          } else {
            // Other cats: smaller image and layout
            catElement = `
              <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                <div class="card-cat">
                  <img src="${cat.photo_url}" height="300" width="400" style="object-fit: cover;" />
                  <div class="overlay-text card-cat-label">Recently Lost</div>
                  <div class="card-body">
                    <h3 class="card-title">${cat.name}</h3>
                    <p class="card-text">${cat.description.slice(0,50)} ...</p>
                    <a href="/cats/${cat.id}" class="btn custom-btn">
                      <i class="fa-solid fa-paw orange-paw"></i>
                      <span class="details-text orange-paw">Details</span>
                    </a>
                  </div>
                </div>
              </div>
            `;
          }

          this.containerTarget.insertAdjacentHTML('beforeend', catElement);
        });
      })
    }
}
