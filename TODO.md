## TO DO

 - [ ] Create XML Parsing function (INPUT: XML / OUTPUT: JSON, OBJECT?)
 - [ ] Create UI: Upload file page
 - [ ] Create UI: Display results (using Chartcss)
 - [ ] Create UI: Frame / Template (aka., "View")


## Thoughts

- v0.1: Simple file upload form and display results on single page, limited design/style, display only results of function (JSON)
- v0.2: Single page still, receive results via websockets and save to localStorage
- v0.3: Single page still, but now showing results as a table, instead of just text
- v0.4: Single page still, now showing results, plus high temps via ZIP code lookup
- v0.5: Single page still, now showing results using Chartcss
- v0.6: Single page still, but now styled using the base view

I would like to build this in multiple microservices, just to start playing with that pattern
parseGreenbuttonXml is one service that expects XML and outputs either JSON or an Object

Also -- for funsies -- I would like to use Svelte, SvelteKit, and Typescript for the UI/Frontend and Crystal for the backend.
Crystal will handle parsing CSV/XML to JSON and will handle getting the temperature data and joining that with the usage data before returning it to TS/Svelte to display the chart or update the chart. Should it create an SQLite database? So, XML/CSV to SQLite and update the SQLite database with temperature data as well and then return a unique ID for the DB so that can be used to access the DB going forward (use the account number to identify in a master table that includes the last date that was registered in usage, last date accessed, account #, UID, etc.)
