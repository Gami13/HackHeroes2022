```javascript
let wojewodztwa = [];
let powiaty = [];
let gminy = [];

function getName(node) {
  let a = node.querySelector("a");
  if (a?.title == undefined) {
    return node.innerText.trim();
  }
  let title = a.title.trim();
  if (node.innerText.trim() != title) {
    return title;
  }
  return node.innerText.trim();
}

function test() {
  let data = document.querySelectorAll("#mw-content-text > div.mw-parser-output > table:nth-child(14) > tbody > tr");
  for (let i = 0; i < data.length; i++) {
    let wojewodztwo = data[i].querySelector("td:nth-child(4)");
    let powiat = data[i].querySelector("td:nth-child(3)");
    let gmina = data[i].querySelector("td:nth-child(2)");
    wojewodztwo = getName(wojewodztwo).replace("Województwo ", "");
    powiat = getName(powiat);
    gmina = getName(gmina).replace(" (gmina)", "").trim();
    //powiat = powiat.innerText.trim()
    //gmina = gmina.innerText.replace("gmina ","").trim()
    //wojewodztwo = wojewodztwo.innerText.trim()
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

```javascript
let querries = [];
let insertQuery = "INSERT INTO wojewodztwa (name) VALUES ";
for (let i = 0; i < wojewodztwa.length; i++) {
  insertQuery += `('${wojewodztwa[i]}')`;
  if (i !== wojewodztwa.length - 1) {
    insertQuery += ", ";
  }
}
querries.push(insertQuery);
insertQuery = "INSERT INTO powiaty (name, wojId) VALUES ";
for (let i = 0; i < powiaty.length; i++) {
  insertQuery += `('${powiaty[i].name}', (SELECT id FROM wojewodztwa WHERE name = '${wojewodztwa[powiaty[i].wojewodztwo]}' LIMIT 1))`;
  if (i !== powiaty.length - 1) {
    insertQuery += ", ";
  }
}
querries.push(insertQuery);
insertQuery = "INSERT INTO gminy (name, powId) VALUES ";
for (let i = 0; i < gminy.length; i++) {
  insertQuery += `('${gminy[i].name}', (SELECT id FROM powiaty WHERE name = '${powiaty[gminy[i].powiat].name}'  LIMIT 1))`;
  if (i !== gminy.length - 1) {
    insertQuery += ", ";
  }
}
querries.push(insertQuery);
console.log(querries.join(";"));
```
