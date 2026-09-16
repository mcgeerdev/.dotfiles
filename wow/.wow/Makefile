# Way of Work control surface.
#
#   make start | stop | restart | status | logs | open
#
# Covers Glance and attentiond. Herdr is not here: it is a long-lived server
# with its own lifecycle, you attach to it with `herdr`, and starting it from a
# Makefile would fight it.

COMPOSE := docker compose -f glance/docker-compose.yml
ATTN := bin/attn-daemon
GLANCE_URL := http://127.0.0.1:8080
ATTENTIOND_URL := http://127.0.0.1:7717

.PHONY: start stop restart status logs glance-logs attn-logs attn open

# The whole stack, minus Herdr.
start:
	@$(COMPOSE) up -d
	@echo "glance:     $(GLANCE_URL)"
	@$(ATTN) start

stop:
	@$(ATTN) stop
	@$(COMPOSE) down

restart:
	@$(COMPOSE) restart
	@$(ATTN) restart

# attentiond in the foreground, which is what you want in a Herdr pane: the log
# is in front of you and Ctrl-C is the off switch.
attn:
	@$(ATTN) run

logs:
	@$(ATTN) logs
	@echo
	@$(COMPOSE) logs --tail 20

attn-logs:
	@$(ATTN) logs -f

glance-logs:
	@$(COMPOSE) logs -f --tail 100

open:
	@open $(GLANCE_URL)

status:
	@echo "glance"
	@$(COMPOSE) ps --format '  {{.Name}}  {{.Status}}  {{.Ports}}' 2>/dev/null | grep . || echo "  not running"
	@printf '  %s  ' "$(GLANCE_URL)"
	@curl -fsS -o /dev/null -w 'HTTP %{http_code}\n' $(GLANCE_URL) 2>/dev/null || echo "unreachable"
	@echo
	@echo "attentiond"
	@$(ATTN) status
	@printf '  %s  ' "$(ATTENTIOND_URL)/health"
	@curl -fsS $(ATTENTIOND_URL)/health 2>/dev/null || echo "not running (the Attention and Meetings widgets will show an error)"
	@echo
	@echo
	@echo "herdr"
	@herdr status 2>/dev/null | sed 's/^/  /' || echo "  herdr not on PATH"
	@echo "  config: $${HERDR_CONFIG_PATH:-<HERDR_CONFIG_PATH unset, falling back to ~/.config/herdr/config.toml>}"
