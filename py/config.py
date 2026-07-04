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
            "active": True,
            "name": "reason",
            "req": True,
            "type": "`$STRING`",
            "index$": 0,
          },
        ],
        "name": "rejection_reason",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "method": "GET",
                "orig": "/no",
                "parts": [
                  "no",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
