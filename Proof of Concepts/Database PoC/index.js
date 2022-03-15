//Importing all necessary constants
const fs = require('fs');
const http = require('http');
const url = require('url');
const employeeReplace = require('../Database PoC/modules/employeeReplace');

//Reading all of the html and css files
const homepage = fs.readFileSync(
    `${__dirname}/pages/homepage.html`, 'utf-8');

const option = fs.readFileSync(
    `${__dirname}/pages/option.html`, 'utf-8');

const employeeJson = fs.readFileSync(
    `${__dirname}/pages/employee.html`, 'utf-8');

const search = fs.readFileSync(
    `${__dirname}/pages/search.html`, 'utf-8');

const css = {
    homepage: fs.readFileSync(`${__dirname}/resources/homepage.css`, 'utf-8'),
    employee: fs.readFileSync(`${__dirname}/resources/employee.css`, 'utf-8'),
    search: fs.readFileSync(`${__dirname}/resources/search.css`, 'utf-8'),
    navbar: fs.readFileSync(`${__dirname}/resources/navbar.css`, 'utf-8'),
}

const data = fs.readFileSync(`${__dirname}/data/data.json`, 'utf-8');
const dataObj = JSON.parse(data); //Parsing json data

//Creating the http server
const server = http.createServer((req, res) => {
    const {
        query,
        pathname
    } = url.parse(req.url, true);

    //Finding each HTML/css page if it exists
    if (pathname === '/' || pathname === '/homepage') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const options = dataObj.map(el => employeeReplace(option, el)).join('');
        const output = homepage.replace('employeeOption', options);
        res.end(output);

    } else if (pathname === '/employee') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const employee = dataObj[query.id];
        const output = employeeReplace(employeeJson, employee);
        res.end(output);
        
    } else if (pathname === '/api') {
        res.writeHead(200, {
            'Content-type': 'application/json'
        });
        res.end(data);

    } else if (pathname === '/search') {
        res.writeHead(200, {
            'Content-type': 'text/html'
        });
        const output = search;
        res.end(output);

    } else if (pathname === '/homepage.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.homepage)

    } else if (pathname === '/employee.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.employee)
    } else if (pathname === '/search.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.search)
    } else if (pathname === '/navbar.css') {
        res.writeHead(200, {
            'Content-type': 'text/css'
        })
        res.end(css.navbar)
    }
});

//Allowing the server to listen on localhost and port 8000
server.listen(8000, '127.0.0.1', () => {
    console.log('Please type localhost:8000 in browser');
});