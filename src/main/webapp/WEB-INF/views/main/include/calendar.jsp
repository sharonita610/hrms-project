<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<style>
    .calendar {
        border-collapse: collapse;
        width: 250px;
        height: fit-content;
    }
    .days{
        margin: 0 auto;
    }

    td {
        border: 1px solid #a3a3a3;
        padding: 5px;
        text-align: center!important;
    }
    .today {
        background-color: lightblue;

    }
    .calendar-btn{
        border: 1px solid darkslategrey;
        border-radius: 25px;
    }

</style>


<table id="calendar"class="calendar">
    <tr>
        <th colspan="7">
            <button class="calendar-btn" onclick="prevMonth()">&#8249;</button>
            <span id="currentMonth"></span>
            <button class="calendar-btn" onclick="nextMonth()">&#8250;</button>
        </th>
    </tr>
    <div>
    <tr>
        <th class="days">일</th>
        <th class="days">월</th>
        <th class="days">화</th>
        <th class="days">수</th>
        <th class="days">목</th>
        <th class="days">금</th>
        <th class="days">토</th>
    </tr>
    </div>
    <tbody id="calendarBody"></tbody>
</table>


<script>
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
</script>
</html>