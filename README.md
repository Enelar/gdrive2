# RUN

To read manual: docker run enelar/gdrive2:man 

To use binary: docker run enelar/gdrive2

(Do not forget to map volumes)

Ex:

docker run -v gdrive-auth-token:/grive enelar/gdrive2

# Always use correct user:

docker run --user=1000 -v gdrive-auth-token:/grive enelar/gdrive2

# Increase Gdrive limits:

Create APP ID as described here: https://github.com/vitalif/grive2#different-oauth2-client-to-workaround-over-quota-and-google-approval-issues
docker run -ti -v gdrive-auth-token:/grive enelar/gdrive2 -a --id "APP_ID" --secret "APP_SECRET" -u .

Then always run with this volume to have increased limits:
docker run -v gdrive-auth-token:/grive enelar/gdrive2