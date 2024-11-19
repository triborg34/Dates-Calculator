let startDate = null;
let endDate = null;

const startDateButton = document.getElementById('startDateButton');
const endDateButton = document.getElementById('endDateButton');
const calculateButton = document.getElementById('calculateButton');
const resultDiv = document.getElementById('result');
const author = document.getElementById('author');

startDateButton.addEventListener('click', async () => {
  startDate = prompt("Enter Start Date (yyyy/mm/dd):");
  if (startDate) {
    startDateButton.textContent = `Start Date: ${startDate}`;
  }
});

endDateButton.addEventListener('click', async () => {
  endDate = prompt("Enter End Date (yyyy/mm/dd):");
  if (endDate) {
    endDateButton.textContent = `End Date: ${endDate}`;
  }
});

calculateButton.addEventListener('click', () => {
  if (!startDate || !endDate) {
    alert("Please select both start and end dates.");
    return;
  }

  const start = startDate.split('/').map(Number);
  const end = endDate.split('/').map(Number);

  const startJalali = jalaali.toGregorian(start[0], start[1], start[2]);
  const endJalali = jalaali.toGregorian(end[0], end[1], end[2]);

  const startTime = new Date(startJalali.gy, startJalali.gm - 1, startJalali.gd);
  const endTime = new Date(endJalali.gy, endJalali.gm - 1, endJalali.gd);

  const diffDays = Math.floor((endTime - startTime) / (1000 * 60 * 60 * 24)) + 1;

  let years = end[0] - start[0];
  let months = end[1] - start[1];
  let days = end[2] - start[2];

  if (days < 0) {
    months -= 1;
    days += 30; // Approximation
  }
  if (months < 0) {
    years -= 1;
    months += 12;
  }

  const totalMonths = years * 12 + months;
  const weeks = Math.floor(diffDays / 7);
  const remainingDays = diffDays % 7;

  resultDiv.innerHTML = `
    معادل ${diffDays} روز<br>
    معادل ${years} سال و ${months} ماه و ${days} روز<br>
    معادل ${totalMonths} ماه و ${days} روز<br>
    معادل ${weeks} هفته و ${remainingDays} روز
    
  `;
});

author.addEventListener('click', () => {
  alert("This app is made by Mohamad Taheri");
});