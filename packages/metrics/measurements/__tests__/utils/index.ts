
import { getConnections as getC } from '@launchql/db-testing';

export const getConnections = async () => {
  return getC(['measurements'], { plan: 'launchql.plan' });
};
