const {
    Given,
    When,
    Then,
    After,
    AfterAll
} = require("@cucumber/cucumber") //Support for gherkin
const puppeteer = require("puppeteer") //Puppeteer for running tests with await and async
const {
    strictEqual
} = require("assert") //Ensures urls match where necessary

const server = require("../../../public/index") //Starts the server by calling the index.js file

/* Custom function which is used to make sure the page waits for loading before checking if navigation has occured. */
function waitForNav(page) {
    return page.waitForNavigation({
        timeout: 2000,
        waitUntil: "load"
    })
}

/* Launches the testing server onto the specified page.
The browser is headless, so the tests are run in the background. */
Given("I am on the {string} page", {
    timeout: 30000
}, async (url) => {
    this.browser = await puppeteer.launch({
        headless: true,
        slowMo: 20 //Made sure the tests did not outpace the checks, which caused some tests to fail
    })
    this.page = (await this.browser.pages())[0]
    await this.page.goto(url, {
        waitUntil: "load"
    })
})

/* Sets the filter for the search page before the search input */
Given("I am filtering for {string}", async (filterOption) => {
    await this.page.select("select.form-control", filterOption)
})

/* Navigates directly to another page using it's url from the initial page */
Given("I navigate to the page {string}", async (url) => {
    await this.page.goto(url, { waitUntil: "load" })
})

/* Clicks on an item in the navigation bar, first clicking the toggle button to open it. 
   Throws an error if the item does not exist. */
When("I am clicking the {string} item", async (navItem) => {
    const waiting = waitForNav(this.page)
    const [element] = await this.page.$x(`//div[@class="topnav"]/div/a[contains(., "${navItem}")]`)
    if (!element)
        console.log(`Could not find a navbar button with the name: "${navItem}"`)
    await element.click()
    await waiting
})

/* Clicks on an employee link item on the homepage. 
   Throws an error if the employee does not exist. */
When("I am clicking the {string} employee", async (employeeName) => {
    const waiting = waitForNav(this.page)
    const [element] = await this.page.$x(`//figure[contains(., "${employeeName}")]/a[@class="option_link"]`)
    if (!element)
        throw `Could not find a employee the name: "${employeeName}"`
    await element.click()
    await waiting
})

/* Clicks on the specified button (in this case, the previous button) */
When("I am clicking the button with the id {string}", async (buttonId) => {
    const waiting = waitForNav(this.page)
    this.page.click(`#${buttonId}`)
    await waiting
})

/* Fills in the search input as specified */
When("I type {string} inside the search input", async (searchbarInput) => {
    await this.page.type("#search_input", searchbarInput)
})

/* Clicks on an employee hyperlink in the hierachy section of an employee page.
   Throws an error if the employee does not exist.  */
When("I am clicking the hierarchy employee {string}", async (employee) => {
    const waiting = waitForNav(this.page)
    const [element] = await this.page.$x(`//a[contains(., "${employee}")]`)
    if (!element)
    throw `Could not find a employee the name: "${employeeName}"`
    await element.click()
    await waiting
})

/* Checks if the resulting page is the correct page */
Then("I should redirect to the {string} page", async (url) => {
    strictEqual(this.page.url(), url)
})

/* Checks if the search results are as expected.
   Throws an error if an expected employee is not shown. */
Then("I should see the employees {string}", async (employees) => {
    const expectedNames = employees.split(/,\s*/)
    const actualNames = await this.page.evaluate(() => {
        const output = []
        document.querySelectorAll("div.output_empName").forEach(employeeNameElement => {
            output.push(employeeNameElement.innerHTML)
        })
        return output
    })
    expectedNames.forEach(expectedName => {
        if (!actualNames.includes(expectedName))
            throw `Could not find ${expectedName}`
    })
})

/* Closes the headless browser after each completed test. */
After(async () => {
    if (this.browser)
        await this.browser.close()
})

/* Closes the server when all testing is complete. */
AfterAll(() => {
    server.close()
})