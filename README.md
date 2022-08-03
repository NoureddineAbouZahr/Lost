<div align="center">
  <img src="./Readme/title.png" alt="">
  
  > Hello world! This is the project’s summary that describes the project plain and simple, limited to the space available.  
**[PROJECT PHILOSOPHY](#project-philosophy) • [WIREFRAMES](#wireframes) • [TECH STACK](#tech-stack) • [IMPLEMENTATION](#implementation) • [HOW TO RUN?](#how-to-run)**
</div>


<div align="center">
  <img id="project-philosophy" src="./Readme/ph.png"/>
</div>

  > Lost is a lost and found application that will help people who had found an object to publish this object with its
  specifications, and users who have lost their stuff can find them with application by showin similar items.
  
  ### User Stories
  - As a user, I found a lost Item and want to publish it to reach its owner.
  - As a user, I want to search for my lost item and check if my item is    published.
  - As a user, I want to contact the person who published my lost item to get it back.

  <br><br>  

  <div align="center">
    <img id="project-philosophy" src="./Readme/wf.png"/>
  </div>
  > This design was planned before on paper, then moved to Figma app for the fine details.
Note that i didn't use any styling library or theme, all from scratch and using pure css modules

<table align="center" style="text-align: center;">
  <tr>
    <td>
      <h2>Login Page</h2>
    </td>
    <td>
      <h2>Choosing what are you doing</h2>
    </td>
  </tr>

  <tr>
    <td><img src="./Readme/one.png" /></td>
    <td><img src="./Readme/2.png" /></td>

  </tr>
  <tr>
    <td>
      <h2>Choosing Category</h2>
    </td>
    <td>
      <h2>Passing Specs of found object</h2>
    </td>
  </tr>

  <tr>
    <td><img src="./Readme/three.png" /></td>
    <td><img src="./Readme/four.png" /></td>

  </tr>
  <tr>
    <td>
      <h2>Similar Items</h2>
    </td>
    <td>
      <h2>Item Data</h2>
    </td>
  </tr>

  <tr>
    <td><img src="./Readme/five.png" /></td>
    <td><img src="./Readme/six.png" /></td>

  </tr>

</table>

<div align="center">
<img id="project-philosophy" src="./Readme/tech.png"/>
  </div>

<ul>
  <li>
    This project uses the Flutter app development framework. Flutter is a cross-platform hybrid app development platform
    which allows us to use a single codebase for apps on mobile, desktop, and the web.
  </li>
  <li>
    For storing the database, the app uses Mongooose ODM to store all data.
  </li>
  <li>
 For implementing the realtime chat Firebase is used to store conversations between users.
  </li>
</ul>
<br>


> Using the above mentioned tech stacks and the wireframes build with figma from the user sotries we have, the implementation of the app is shown as below, these are screenshots from the real app.

<table align="center" style="text-align: center;">
  <tr>
    <td>
      <h2>Login</h2>
    </td>
    <td>
      <h2>Register</h2>
    </td>

  <tr>
    <td>
      <img src="./Readme/sc1.jpg" />
    </td>
    <td>
      <img src="./Readme/sc2.jpg" />
    </td>
  </tr>
  <tr>
    <td>
      <h2>Welcome</h2>
    </td>
    <td>
      <h2>Categories</h2>
    </td>
  </tr>
  <tr>
    <td>
      <img src="./Readme/sc3.jpg" />
    </td>
    <td>
      <img src="./Readme/sc4.jpg" />
    </td>
  </tr>
  <tr>
    <td>
      <h2>Posting lost item</h2>
    </td>
    <td>
      <h2>Showing similar items</h2>
    </td>
  </tr>
  <tr>
    <td>
      <img src="./Readme/sc5.jpg" />
    </td>
    <td>
      <img src="./Readme/sc6.jpg" />
    </td>

  </tr>
  <tr><td><h2>Item post</h2></td></tr>
  <tr>
    <td>
      <img src="./Readme/sc6.jpg" />
    </td>

  </tr>

</table>
<br><br>
<table style="text-align: center;">
  <tr>
    <td>
      <h2>This is the admin web app</h2>
    </td>
  </tr>
  <tr>
    <td><img src="./Readme/admin.jpg" /></td>
  </tr>
</table>
<br><br>

> Now to connect to the data base you should run the command `node index.js`

<ul>
  <li>
    Then to run the admin app change directory to the admin folder the run the `npm start` command in the command prompt
  </li>
  <li>
    <img src="./Readme/runadmin.jpg" />
  </li>
  <li>
    Then to run the mobile app you hove to open folder mobile app in android studio and connect your phone with usb
    debugging to install the app the update in utils the ip address of the local host to get access to database and change the ip address to your local ip adress
  </li>


</ul>
