let today = new Date();
let currentMonth = today.getMonth();
let currentYear = today.getFullYear();
let months = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];

function displayCalendar() {
    let firstDay = (new Date(currentYear, currentMonth)).getDay();
    let daysInMonth = 32 - new Date(currentYear, currentMonth, 32).getDate();

    let calendarBody = document.getElementById("calendarBody");
    calendarBody.innerHTML = "";

    document.getElementById("currentMonth").innerHTML = months[currentMonth] + " " + currentYear;

    let date = 1;
    for (let i = 0; i < 6; i++) {
        let row = document.createElement("tr");

        for (let j = 0; j < 7; j++) {
            if (i === 0 && j < firstDay) {
                let cell = document.createElement("td");
                let cellText = document.createTextNode("");
                cell.appendChild(cellText);
                row.appendChild(cell);
            } else if (date > daysInMonth) {
                break;
            } else {
                let cell = document.createElement("td");
                let cellText = document.createTextNode(date);

                if (date === today.getDate() && currentMonth === today.getMonth() && currentYear === today.getFullYear()) {
                    cell.classList.add("today");
                }

                cell.appendChild(cellText);
                row.appendChild(cell);
                date++;
            }
        }

        calendarBody.appendChild(row);
    }
}

displayCalendar();

function prevMonth() {
    if (currentMonth === 0) {
        currentMonth = 11;
        currentYear--;
    } else {
        currentMonth--;
    }

    displayCalendar();
}

function nextMonth() {
    if (currentMonth === 11) {
        currentMonth = 0;
        currentYear++;
    } else {
        currentMonth++;
    }

    displayCalendar();
}