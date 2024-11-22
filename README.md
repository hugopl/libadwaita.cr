<h1 align="center">libadwaita.cr</h1>
<h4 align="center">libadwaita bindings for Crystal</h4>

#

<p align="center">
    <img src="https://i.imgur.com/H6a5Git.png" alt="screenshot of the an example libadwaita.cr app" width="512" />
</p>

## Notes

- Bindings are being generated using [gi-crystal](https://github.com/hugopl/gi-crystal).
- It includes everything [gtk4.cr](https://github.com/hugopl/gtk4.cr) does plus libadwaita.

## Dependencies

- ArchLinux: `pacman -S gtk4 gobject-introspection libadwaita`

Other distros will probably require you to manually install libadwaita development packages somehow.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     libadwaita:
       github: hugopl/libadwaita.cr
   ```

2. Run `shards install`
3. Run `./bin/gi-crystal` to generate the bindings

## Usage

Follow the instructions over at [gtk4.cr](https://github.com/hugopl/gtk4.cr) and [gi-crystal](https://github.com/hugopl/gi-crystal) as well as the [examples/](./examples/) folder

## Contributing

1. Fork it ( https://github.com/hugopl/libadwaita.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request
