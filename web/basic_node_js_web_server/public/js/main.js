'use strict';

const sayHello = async () => {
    const username = document.getElementById("user").value;
    window.location.href = `/hello/${username}`;
}

const incrementCounter = async e => {
    const increment = Math.abs(e.target.textContent);
    const response = await fetch(`/increment/counter`, {
        method: 'POST',
        mode: "same-origin",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            increment
        })
    });
    const data = await response.json();
    document.getElementById("counter").textContent = `Counter: ${data.counter}`;
}

const decrementCounter = async e => {
    const decrement = Math.abs(e.target.textContent);
    const response = await fetch(`/decrement/counter`, {
        method: 'POST',
        mode: "same-origin",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            decrement
        })
    });
    const data = await response.json();
    document.getElementById("counter").textContent = `Counter: ${data.counter}`;
}

const getCounter = async () => {
    const response = await fetch('/counter', { method: 'GET' });
    return await response.json();
}

const init = async () => {
    document.getElementById("hello").addEventListener("click", sayHello);
    const counter = await getCounter();
    document.getElementById("counter").textContent = `Counter: ${counter.counter}`;
    for (const btn of document.querySelectorAll(".increment")) {
        btn.addEventListener("click", e => incrementCounter(e));
    }
    for (const btn of document.querySelectorAll(".decrement")) {
        btn.addEventListener("click", e => decrementCounter(e));
    }
}

window.addEventListener('load', init);
