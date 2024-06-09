### JustEd Dashboard 
<hr>

This is the client-side app _(frontend)_ of JustEd's LMS. 

#### Running This App

**1. Running Locally**

This method is preferred during development. After you have cloned this repository, run the following commands:

```sh
npm i
npm run dev
```

This will run the app at http://localhost:5173/. To stop the process, press `Ctrl + C` on the active terminal tab and it shall stop the server. 


**2. Using Docker**

If you want to run the final build product, this method is preferred. Assuming you have docker installed in your system and you are in the root directory _(main project folder where you can see Dockerfile)_, following commands should be executed: 

```sh
docker build -t justed_lms .
docker run -p 3000:3000 justed_lms  # The default port of builds is 3000.
```

Again, to stop the process, press `Ctrl + C` on the active terminal tab and it shall stop the server. 

<hr>
