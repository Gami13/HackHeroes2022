```javascript
let wojewodztwa = [];
let powiaty = [];
let gminy = [];
function test() {
  let data = document.querySelectorAll("#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr");
  for (let i = 0; i < data.length; i++) {
    let wojewodztwo = data[i].querySelector("td:nth-child(4)");
    let powiat = data[i].querySelector("td:nth-child(3)");
    let gmina = data[i].querySelector("td:nth-child(2)");
    powiat = powiat.innerText.trim();
    gmina = gmina.innerText.replace("gmina ", "").trim();
    wojewodztwo = wojewodztwo.innerText.trim();
    if (!wojewodztwa.includes(wojewodztwo)) {
      wojewodztwa.push(wojewodztwo);
    }
    if (!powiaty.find((x) => x.name == powiat)) {
      powiaty.push({ name: powiat, wojewodztwo: wojewodztwa.indexOf(wojewodztwo) });
    }
    if (!gminy.includes({ name: gmina, powiat: powiaty.indexOf({ name: powiat, wojewodztwo: wojewodztwo }) })) {
      gminy.push({ name: gmina, powiat: powiaty.findIndex((x) => x.name == powiat && x.wojewodztwo == wojewodztwa.indexOf(wojewodztwo)) });
    }
  }
  console.log(wojewodztwa);
  console.log(powiaty);
  console.log(gminy);
}
test();
```
