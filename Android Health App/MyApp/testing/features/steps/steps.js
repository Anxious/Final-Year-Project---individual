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
app.use(express.static(path.join(__dirname, "../../../www")))
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
Given("I am on the {string} page", async (url) => {
    this.browser = await puppeteer.launch({
        headless: true,
        slowMo: 15 //Made sure the tests did not outpace the checks, which caused some tests to fail
    })
    this.page = (await this.browser.pages())[0]
    await this.page.goto(url, {
        waitUntil: "load"
    })
})

/* Clicks on the specified button */
When("I click on the button with the id {string}", async (buttonId) => {
    const waiting = waitForNav(this.page)
    this.page.click(`#${buttonId}`)
    await waiting
})

/* Clicks on the carousel left/right button a specified amount of times */
When("I click on {string} button {int} times", async (buttonClass, clickCount) => {
    for (let i = 0; i < clickCount; i++) {
        await this.page.click(`.${buttonClass}`, {
            delay: 500
        })
    }
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

/* Checks if the resulting page is the correct page */
Then("I should redirect to the {string} page", async (url) => {
    strictEqual(this.page.url(), url)
})



/* Checks if the carousel is displaying the correct image. */
Then("I should be able to see the image {string}", async (imageLink) => {
    await this.page.waitForTimeout(1000)
    const actualImageLink = await this.page.evaluate(() => {
        return document.querySelector("div.carousel-item.active").getElementsByTagName("img")[0].src
    })
    strictEqual(actualImageLink, imageLink)
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