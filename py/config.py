# NoAsAServiceTwo SDK configuration


def make_config():
    return {
        "main": {
            "name": "NoAsAServiceTwo",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://naas.isalman.dev",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "rejection_reason": {},
            },
        },
        "entity": {
      "rejection_reason": {
        "fields": [
          {
            "name": "reason",
            "req": True,
            "type": "`$STRING`",
            "active": True,
            "index$": 0,
          },
        ],
        "name": "rejection_reason",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/no",
                "parts": [
                  "no",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
