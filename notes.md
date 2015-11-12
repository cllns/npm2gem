# Notes

## Plan

- [x] 1. Parse `bower.json` to copy 'main' files into `vendor/assets`
   (later, either check existing vendor/assets files and find those too, since
    not all files are in 'main', like stylesheets)

- [ ] 2. Make commit on a branch `upgrade-to-v-X.Y.Z`

- [ ] 3. Open a GitHub PR

- [ ] 4. Allow subscribing, so have cron job that runs every 4 hours to check bower
   for updates (likely manually hardcoded at first)

## TODO
- [ ] Support globs in .bower2gem.yml file
- [ ] Check git tags for version? Or just allow user to enter manually
- [ ] When copying and files exist, confirm with user (possibly read version from
  file itself)
- [ ] Add Support for:
  - [ ] Fonts
  - [ ] Sass (and Less?)
  - [ ] CoffeeScript?
