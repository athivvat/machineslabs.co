import * as migration_20260603_192730_initial from './20260603_192730_initial';
import * as migration_20260605_180139 from './20260605_180139';
import * as migration_20260608_155405_add_prefix_to_media from './20260608_155405_add_prefix_to_media';

export const migrations = [
  {
    up: migration_20260603_192730_initial.up,
    down: migration_20260603_192730_initial.down,
    name: '20260603_192730_initial',
  },
  {
    up: migration_20260605_180139.up,
    down: migration_20260605_180139.down,
    name: '20260605_180139',
  },
  {
    up: migration_20260608_155405_add_prefix_to_media.up,
    down: migration_20260608_155405_add_prefix_to_media.down,
    name: '20260608_155405_add_prefix_to_media'
  },
];
