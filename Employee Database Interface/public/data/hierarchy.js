/* Function to fill the hierarchy section of an employee page with the necessary employee hyperlinks.
   Any employee will have supervisors or subordinates, sometimes both.
   In the case that an employee only has one of the two, only the relevant category will be displayed. */
module.exports = (data, target, employees) => {
    if (target.supervisor !== undefined) { //There will only ever be one supervisor for an employee, if any, so only one or none is accounted for
        data = data.replace(/{%SUPERVISOR%}/, `<div class=\"employee_supervisor\">Supervisor:&nbsp;<a href="employee?id=${target.supervisor}">${employees[target.supervisor].empName}</a></div>`)
    }
    data = data.replace(/{%SUPERVISOR%}/, "")

    if (target.subordinates !== undefined) {
        let replacement = undefined
        if (target.subordinates.length > 1) { //Checking if the subordinate(s) part of the hierarchy should be plural
            replacement = "<div class=\"employee_subordinates\">Subordinates:&nbsp;"
        } else {
            replacement = "<div class=\"employee_subordinates\">Subordinate:&nbsp;"
        }
        let first = true
        target.subordinates.forEach(element => { //Iterates through the subordinates and creates a new hyperlink for each one
            if (!first) { //The first subordinate should not have a comma in front of them
                replacement += ",&nbsp;"
            }
            replacement += `<a href="employee?id=${element}">${employees[element].empName}</a>`
            first = false
        });
        data = data.replace(/{%SUBORDINATES%}/, replacement + "</div>")
    } else {
        data = data.replace(/{%SUBORDINATES%}/, "")
    }
    return data
}