# Use as template for secrets.yml

<pre>
---
development:
  SESSION_SECRET: "<generate: `rake generate:session_secret`>"
  MSG_KEY:        "<generate: `rake generate:msg_key`>"
  REDIS_URL:      "Provision a Redis URL"

test:
  SESSION_SECRET: "<generate: `rake generate:session_secret`>"
  MSG_KEY:        "<generate: `rake generate:msg_key`>"
  REDIS_URL:      "Provision a Redis URL"

production:
  SESSION_SECRET: "<generate: `rake generate:session_secret`; add to production envirnoment variables>"
  MSG_KEY:        "<generate: `rake generate:msg_key`; add to production envirnoment variables>"
  REDIS_URL:      "Provision a Redis URL"

  </pre>