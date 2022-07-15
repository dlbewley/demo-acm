.PHONY: htpasswd

htpasswd:
	../../bin/mkhtpasswd secrets/passwords secrets/htpasswd

oauth:
	oc patch oauth/cluster --patch-file patch-oauth.yaml
