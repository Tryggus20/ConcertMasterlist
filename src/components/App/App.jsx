import react, { useEffect } from "react";
import {
  HashRouter as Router,
  Redirect,
  Route,
  Switch,
} from "react-router-dom";

import { useDispatch, useSelector } from "react-redux";

//import Nav from "../Nav/Nav";\
import AboutPage from "../AboutPage/AboutPage";
import HomePage from "../HomePage/HomePage";

// document.addEventListener("DOMContentLoaded", (event) => {
//   const app = firebase.app();
//   console.log(app);
//   // gives an object with firebase credentials^
// });

// function googleLogin() {
//   const provider = new firebase.auth.GoogleAuthProvider();
//   firebase
//     .auth()
//     .signInWithPopup(provider)
//     .then((result) => {
//       const user = result.user;
//       document.write(`Hello ${user.displayName}`);
//       console.log(user);
//     })
//     .catch(console.log);
// }
function App() {
  return (
    <Router>
      <Switch>
    <div>
      {/* <Nav /> */}
      <Route exact path="/" component={HomePage} />
      <Route path="/about" component={AboutPage} />
    </div>
    </Switch>
  </Router>
  )
}
export default App;