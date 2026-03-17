FROM puppet/puppetserver:latest

# Enable autosigning for lab use (any certificate request is accepted)
RUN puppet config set autosign true --section master

EXPOSE 8140

CMD ["foreground"]