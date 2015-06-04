# Peonies

This is a test app by @atmos

![](https://cloud.githubusercontent.com/assets/38/7949418/88e29856-0942-11e5-98b0-17d37dae54e3.jpg)

### Chat Tokens

Grab an authorization token from the [Slack Docs](https://api.slack.com/web). You can provide an array of tokens for each slack subdomain that you're a part of. Add them to `~/.peonies.json`.

```javascript
[
  "xoxp-aaaaaaaaa-bbbbbbbbb-cccccccccc-dddddd",
  "xoxp-eeeeeeeee-fffffffff-gggggggggg-hhhhhh",
  "xoxp-iiiiiiiii-jjjjjjjjj-kkkkkkkkkk-llllll"
]
```

### Running

    % npm i
    % export SLACK_TOKEN=whateveryougot
    % electron .

### Testing

You can test by running the following.
    
    % npm install
    % npm test

:revolving_hearts: :smiley_cat: :smiley:
