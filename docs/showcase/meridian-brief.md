# Meridian

Cash-flow intelligence for finance teams at mid-size companies (50 to 500 staff). Connects to bank accounts, the ERP, payroll, and AR/AP; forecasts cash position 13 weeks out; flags late receivables and unusual outflows; models scenarios.

Users: the controller and the FP&A analyst open it every morning; the CFO opens it before the Monday leadership meeting. They live in spreadsheets and expect precision, tabular numbers, and no decoration.

What we are building now: the main cash overview screen, authenticated. It must answer: what is our cash position today, where does it go over the next 13 weeks, what is at risk this week, and what should I chase or approve today.

Key data: accounts (6 bank accounts across 3 currencies), daily balances, forecast by week with confidence band, receivables aging with customer names and days late, payables due this week with approval state, scenario toggles (delay a customer, defer capex), alerts.

Stack: single HTML/CSS/JS page, no framework, no chart library, charts as inline SVG. Brand: name only, no assets. Private route.
