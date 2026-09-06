#!/bin/bash
set -e

# The home directory is a named volume, so on first run (or if it was
# recreated) it may not have the right ownership yet - fix that before
# sshd starts, otherwise login will fail with permission errors.
chown -R "${STUDENT_USER}:${STUDENT_USER}" "/home/${STUDENT_USER}"

# Make sure host keys exist (they're normally generated at package-install
# time during the image build, but regenerate defensively).
ssh-keygen -A

PORT_SUFFIX=""
if [ "${SSH_PORT:-22}" != "22" ]; then
    PORT_SUFFIX=" -p ${SSH_PORT}"
fi

cat <<EOF

========================================================
 Server is up. Connect with:

     ssh ${STUDENT_USER}@localhost${PORT_SUFFIX}

========================================================

EOF

exec /usr/sbin/sshd -D
