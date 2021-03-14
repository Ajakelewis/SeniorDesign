// Constant containing the main URL for pulling list of movies from the TMDB API
const APIURL =
  "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=a7e57cb63bb601a072aac4703302f6dc";
// Constant containing the URL to access images from the TMDB API
const IMGPATH = "https://image.tmdb.org/t/p/w1280";
// Constant containing the URL for search function from the TMDB API
const SEARCHAPI =
  "https://api.themoviedb.org/3/search/movie?&api_key=a7e57cb63bb601a072aac4703302f6dc&query=";

// Pulls the element inside the "search" ID
const search = document.getElementById("search");

// Form for search bar
const form = document.getElementById("form");

// Used for listmovies to put all movies in main
const main = document.getElementById("main");

// ░█████╗░██╗░░░░░██████╗░███████╗███╗░░██╗
// ██╔══██╗██║░░░░░██╔══██╗██╔════╝████╗░██║
// ███████║██║░░░░░██║░░██║█████╗░░██╔██╗██║
// ██╔══██║██║░░░░░██║░░██║██╔══╝░░██║╚████║
// ██║░░██║███████╗██████╔╝███████╗██║░╚███║
// ╚═╝░░╚═╝╚══════╝╚═════╝░╚══════╝╚═╝░░╚══╝

// Constant's containing URLS to pull movies from the TMDB API in a sorted order
// Sorted by Newest
const NEWESTAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=primary_release_date.desc&include_adult=false&include_video=false&page=1&release_date.lte=2020-12-10&vote_count.gte=1";
//Sorted by the Top Rated
const TOPRATEDAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=vote_average.desc&include_adult=false&include_video=false&page=1&release_date.lte=2020-12-10&vote_count.gte=1";
// Sorted by the Action genre
const ACTIONAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1&with_genres=28";
// Sorted by the Drama genre
const DRAMAAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1&with_genres=18";
// Sorted by the Thriller genre
const THRILLERAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1&with_genres=53";
// Sorted by the Comedy genre
const COMEDYAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1&with_genres=35";
// Sorted by the Family genre
const FAMILYAPI =
  "https://api.themoviedb.org/3/discover/movie?api_key=a7e57cb63bb601a072aac4703302f6dc&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&vote_count.gte=1&with_genres=10751";

// ██╗░░██╗███████╗██╗░░░██╗██╗███╗░░██╗
// ██║░██╔╝██╔════╝██║░░░██║██║████╗░██║
// █████═╝░█████╗░░╚██╗░██╔╝██║██╔██╗██║
// ██╔═██╗░██╔══╝░░░╚████╔╝░██║██║╚████║
// ██║░╚██╗███████╗░░╚██╔╝░░██║██║░╚███║
// ╚═╝░░╚═╝╚══════╝░░░╚═╝░░░╚═╝╚═╝░░╚══╝

//This will call the async function, getMovies when passing the URL link w/ api key
getMovies(APIURL);

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
//async functions will return promise
//This func will return will suspend UNTIL the "await" expression
// returns a promise that is fulfilled or rejected
// We use this function to call and take information from the Website with our API key
async function getMovies(url) {
  const response = await fetch(url);
  // https://developer.mozilla.org/en-US/docs/Web/API/Response
  const responseData = await response.json();

  // console.log(responseData);   //keep for testing purposes

  //responseData is an object with the .results being tied to metadata from the TMDB when we call information from the API
  listMovies(responseData.results);
}

// ███╗░░░███╗██╗██╗░░██╗███████╗
// ████╗░████║██║██║░██╔╝██╔════╝
// ██╔████╔██║██║█████═╝░█████╗░░
// ██║╚██╔╝██║██║██╔═██╗░██╔══╝░░
// ██║░╚═╝░██║██║██║░╚██╗███████╗
// ╚═╝░░░░░╚═╝╚═╝╚═╝░░╚═╝╚══════╝

function listMovies(movies) {
  // clears the inside of main tag
  main.innerHTML = "";

  // calls a function once for each element in the movie object, in order:
  movies.forEach(movie => {
    const {
      poster_path,
      title,
      vote_average,
      release_date,
      popularity,
      original_language,
      overview,
      id,
      genre_ids
    } = movie;

    const movieEl = document.createElement("div");
    movieEl.classList.add("movie");

    //replace everything in main tag with divs below

    movieEl.innerHTML = ` 
        
      <a href="https://www.themoviedb.org/movie/${id}" target="_blank">
   
            <img
                src="${IMGPATH + poster_path}"
                alt="${title}"
            />
            <div class="movie-info">
                <h3>${title}</h3>
                <span class="${getClassByRate(
                  vote_average
                )}">${vote_average}</span>
            </div>
            <div class="release-date">
                  <h3>Release Date:</h3>
                  ${release_date}
            </div>
            <div class="popularity">
                  <h3>Popularity:</h3>
                  ${popularity}
            </div>
            <div class="genres">
                  <h3>Genre ID's:</h3>
                  ${genre_ids}
            </div>
            </div>  
            <div class="originlanguage">
                  <h3>Original Language:</h3>
                  ${original_language}
            </div>                
            <div class="summary">
                <h3>SUMMARY:</h3>
                ${overview}
            </div>
         
           </a>
        `;

    main.appendChild(movieEl);
  });
}

// ░█████╗░██╗░░░░░██╗░█████╗░███████╗
// ██╔══██╗██║░░░░░██║██╔══██╗██╔════╝
// ███████║██║░░░░░██║██║░░╚═╝█████╗░░
// ██╔══██║██║░░░░░██║██║░░██╗██╔══╝░░
// ██║░░██║███████╗██║╚█████╔╝███████╗
// ╚═╝░░╚═╝╚══════╝╚═╝░╚════╝░╚══════╝

// When we pull information from the API, this function will be called
// the value of "ratings" will be checked against IF statements
//if the vote is the value 1-10, it will be assigned a color to and transfer into the listmovies function where it is being called

function getClassByRate(vote) {
  if (vote >= 8) {
    return "green";
  } else if (vote >= 5) {
    return "orange";
  } else {
    return "red";
  }
}

// ░█████╗░██╗░░░░░██████╗░███████╗███╗░░██╗
// ██╔══██╗██║░░░░░██╔══██╗██╔════╝████╗░██║
// ███████║██║░░░░░██║░░██║█████╗░░██╔██╗██║
// ██╔══██║██║░░░░░██║░░██║██╔══╝░░██║╚████║
// ██║░░██║███████╗██████╔╝███████╗██║░╚███║
// ╚═╝░░╚═╝╚══════╝╚═════╝░╚══════╝╚═╝░░╚══╝

// The following are the event listeners that allow user input to change
// the order in which the movies appear on the website

// This is the Event Listener thats allows the search bar to receive user input
// and add it to the SEARCHAPIURL to find movies
form.addEventListener("submit", enterkey => {
  enterkey.preventDefault();
  const searchTerm = search.value;
  if (searchTerm) {
    getMovies(SEARCHAPI + searchTerm);
    search.value = "";
  }
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the NEWEST API URL instead of the default one
var newestMovies = document.getElementById("newest");
newestMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(NEWESTAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the TOPRATED API URL instead of the default one
var topRatedMovies = document.getElementById("topRated");
topRatedMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(TOPRATEDAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the ACTION API URL instead of the default one
var actionMovies = document.getElementById("action");
actionMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(ACTIONAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the FAMILY API URL instead of the default one
var familyMovies = document.getElementById("family");
familyMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(FAMILYAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the DRAMA API URL instead of the default one
var dramaMovies = document.getElementById("drama");
dramaMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(DRAMAAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the THRILLER API URL instead of the default one
var thrillerMovies = document.getElementById("thriller");
thrillerMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(THRILLERAPI);
});

// This Event Listener waits for a user to click on the Newest nav-item
// to call the getMovies function using the COMEDY API URL instead of the default one
var comedyMovies = document.getElementById("comedy");
comedyMovies.addEventListener("click", () => {
  event.preventDefault();
  getMovies(COMEDYAPI);
});
