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

app.use("/test", testRouter);
/* Error handler middleware */
app.use((err, req, res, next) => {
    const statusCode = err.statusCode || 500;
    console.error(err.message, err.stack);
    res.status(statusCode).json({ message: err.message });
    return;
});

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});