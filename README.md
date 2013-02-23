# Delivery
Simple Rails application that let's you create email groups.

## Install

1. Clone delivery.
2. Modify `config/config.yml`
3. run `bundle install`
4. Deploy!

In order for this to work on your server you need to have the maildir options in `config.yml` pointing to your mail servers mail directory.

In postfix, you can set `home_mailbox = mail/` and run `mkdir ~/home` to get mail in `/home/user/mail`.

You may also want to catch all emails from a particular domain to go to your one user, you can set this up by creating `/etc/postfix/virtual` and adding the following option.

`@domain.tld user`

Domain is the domain you want to catch emails for and user is the user whose mail directory you will be watching.
