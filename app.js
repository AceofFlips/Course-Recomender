import path from 'path';
import {fileURLToPath} from 'url';
import express from 'express';
import testRouter from "./routes/testroute.js";
const app = express();
const port = 8080;

// Define a route for GET requests to the root URL
app.use(express.json());
app.use(
    express.urlencoded({
        extended: true,
    })
);
app.get("/", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Home-Page.html');

    res.sendFile(_retfile);
});

app.get("/faq", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'FAQPage.html');

    res.sendFile(_retfile);
});


app.get("/contact", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Contact-Page.html');

    res.sendFile(_retfile);
});

app.get("/courses", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Results-Page.html');

    res.sendFile(_retfile);
});

app.get("/survey", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Survey-Page.html');

    res.sendFile(_retfile);
});


app.get("/login", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Login-Page.html');

    res.sendFile(_retfile);
});


app.get("/create-account", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Create-Account-Page.html');

    res.sendFile(_retfile);
});


app.get("/password-reset", (req, res, next) => {
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const _retfile = path.join(__dirname, 'Password-Reset-Page.html');

    res.sendFile(_retfile);
});

app.use("/test", testRouter);
/* Error handler middleware */
app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({ message: err.message });
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});