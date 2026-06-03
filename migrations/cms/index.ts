import * as migration_20260603_192730_initial from './20260603_192730_initial';

export const migrations = [
  {
    up: migration_20260603_192730_initial.up,
    down: migration_20260603_192730_initial.down,
    name: '20260603_192730_initial'
  },
];
