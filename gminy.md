```javascript
function getGminy() {
  let woj = document.querySelectorAll(
    "#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(2) > b > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(2) > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(2) > i > a"
  );
  let titles = [];
  for (let i = 0; i < woj.length; i++) {
    titles.push(woj[i].title.replace("gmina ", "").replace("(gmina)", "").trim());
  }
  return titles;
}
function getPowiaty() {
  let pow = document.querySelectorAll(
    "#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(3) > b > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(3) > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(3) > i > a"
  );
  let titles = [];

  for (let i = 0; i < pow.length; i++) {
    titles.push(pow[i].title.trim());
  }
  return titles;
}
function getWojewodztwa() {
  let woj = document.querySelectorAll(
    "#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(4) > b > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(4) > a,#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr > td:nth-child(4) > i > a"
  );
  let titles = [];

  for (let i = 0; i < woj.length; i++) {
    titles.push(woj[i].title.replace("Województwo ", "").trim());
  }
  return titles;
}

let gminy = getGminy();
let powiaty = getPowiaty();
let wojewodztwa = getWojewodztwa();
let combined = [];
for (let i = 0; i < wojewodztwa.length; i++) {
  combined.push(`${gminy[i]} ${powiaty[i]} ${wojewodztwa[i]}`);
}
console.log(combined);
document.body.innerHTML = combined.join("<br>");

/* cześć :) */
```
