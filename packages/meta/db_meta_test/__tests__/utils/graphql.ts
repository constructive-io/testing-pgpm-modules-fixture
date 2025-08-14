import { getConnections as get } from '@launchql/graphql-testing';

export const getConnections = async (schemas: string[]) =>
  get({
    authRole: 'administrator',
    schemas
  });
