# Electrogram

Electrogram is a [SlackHQ](https://slack.com/) desktop client written in [Electron](http://electron.atom.io/) and [ReactJS](https://facebook.github.io/react/).

![](https://cloud.githubusercontent.com/assets/38/8126814/ab1af59c-10a6-11e5-8de0-74e68b688b3d.gif)

## Chat Tokens

Grab an authorization token from the [Slack Docs](https://api.slack.com/web). You can provide an array of tokens for each slack team name that you're a part of. Add them to `~/.electrogram.json`.

```javascript
{
  "channels": [
    { "name": "atmos#general", "alias": "peeps" },
    { "name" :"atmos#hubot-test" }
  ],
  "tokens": [
    "xoxp-aaaaaaaaa-bbbbbbbbb-cccccccccc-dddddd",
    "xoxp-eeeeeeeee-fffffffff-gggggggggg-hhhhhh",
    "xoxp-iiiiiiiii-jjjjjjjjj-kkkkkkkkkk-llllll"
  ]
}
```

## Running

    % npm i
    % electron .

## Testing

You can test by running the following.

    % npm install
    % npm test

:revolving_hearts: :smiley_cat: :smiley:
