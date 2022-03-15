/* Importing the needed constants to run the tests */
const path = require("path") //Used to create the path that the testing server will host from
const express = require("express") 
const app = express() //Used to run the testing server
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

//Creating the testing server on 127.0.0.1:8004
app.use(express.static(path.join(__dirname, "../../../public")))
const server = app.listen(8004, () => {
    console.log("Listening on port 8004")
}) 

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
        slowMo: 15 //Made sure the tests did not outpace the checks, which caused some tests to fail
    })
    this.page = (await this.browser.pages())[0]
    await this.page.goto(url, {
        waitUntil: "load"
    })
})

/* Clicks on an item in the navigation bar, first clicking the toggle button to open it. 
   Throws an error if the item does not exist. */
When("I am clicking the {string} item", async (navItem) => {
    const waiting = waitForNav(this.page)
    await this.page.click("button.navbar-toggler")
    const [element] = await this.page.$x(`//li[@class="nav-item"]/a[contains(., "${navItem}")]`)
    if (!element)
        throw `Could not find a navbar button with the name: "${navItem}"`
    await element.click()
    await waiting
})

/* Clicks on the subscribe button on the homepage */
When("I am clicking the subscribe button", async () => {
    const waiting = waitForNav(this.page)
    await this.page.click("a.subscribe-button")
    await waiting
})

/* Clicks on the an item in the footer.
   Throws an error if the item does not exist. */
When("I am clicking the {string} footer item", async (footerItem) => {
    const waiting = waitForNav(this.page)
    const [element] = await this.page.$x(`//li[@class="footer-item"]/a[contains(., "${footerItem}")]`)
    if (!element)
        throw `Could not find a footer item with the name: "${footerItem}"`
    await element.click()
    await waiting
})

/* Clicks on the left and right carousel buttons a certain number of times to cycle through it */
When("I click on {string} button {int} times", async (buttonClass, clickCount) => {
    for (let i = 0; i < clickCount; i++) {
        await this.page.click(`.${buttonClass}`, {
            delay: 500
        })
    }
})

/* Fills in a text field on a form with a specified input */
When("I fill the field {string} with {string}", async (fieldId, content) => {
    await this.page.type(`#${fieldId}`, content)
})

/* Selects an option from the dropdown menu on the contact us form */
When("I select the option {string}", async (topic) => {
    await this.page.select("#contacttopic", topic)
})

/* Clicks on the specified element (usually a button) */
When("I click on the element with the id {string}", async (elementId) => {
    await this.page.click(`#${elementId}`)
})

/* Checks if the resulting page is the correct page */
Then("I should redirect to the {string} page", async (url) => {
    strictEqual(this.page.url(), url)
})

/* Checks if the carousel is displaying the correct option
   Throws an error if the wrong option is displaying. */
Then("I should be able to see the item {string}", async (title) => {
    await this.page.waitForTimeout(1000)
    const [element] = await this.page.$x(`//div[contains(@class, "carousel-item") and contains(@class, "active")]/div/div/h3`)
    const text = (await (await element.getProperty('textContent')).jsonValue()).replace(/\s\s+/g, "")
    if (text !== title) {
        throw `Carousel did not display the expected title "${title}", but instead displayed the actual title "${text}"`
    }
})

/* Checks if the success alert appears when a form is completed properly.
   Throws an error if this does not happen. */
Then("I should get an alert", async () => {
    await this.page.waitForSelector(`#successful`, {
        timeout: 1000,
        visible: true
    }).catch(() => {
        throw `success alert has not appeared.`
    })
})

/* Checks if the appropriate errors appear when a form is completed improperly.
   Throws an error if this does not happen. */
Then("I should be able to see the errors {string}", async (expectedErrors) => {
    for (const errorName of expectedErrors.split(/,\s*/)) {
        await this.page.waitForSelector(`#${errorName}error`, {
            timeout: 1000,
            visible: true
        }).catch(() => {
            throw `${errorName} has not appeared.`
        })
    }
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